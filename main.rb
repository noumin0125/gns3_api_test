Encoding.default_external = 'UTF-8'
#!/usr/bin/ruby

require "sinatra"
require 'socket'
require './lib/api_gns3'

def my_address
 udp = UDPSocket.new
 udp.connect("128.0.0.0", 7)
 adrs = Socket.unpack_sockaddr_in(udp.getsockname)[1]
 udp.close
 adrs
end

configure do
  gns3_ip = '192.168.12.6'
  gns3_port = '3080'
  GNS3_BASE_URL = "http://#{gns3_ip}:#{gns3_port}/v2"
  WEBSERVER  = "http://#{my_address}:4567".freeze
  $gns3 = Gns3.new(GNS3_BASE_URL)
end

get "/" do
  erb :index
end

get "/resource" do
  @gns3_projects = $gns3.projects
  erb :resource
end

get "/resource/:project_id/nodes" do
  @gns3_nodes = $gns3.nodes(params[:project_id])
  erb :resource_nodes
end

get "/resource/:project_id/projects/:node_id/nodes/start" do
  res = $gns3.node_start(params[:project_id], params[:node_id])
  redirect to("/resource/#{params[:project_id]}/nodes")
end

get "/resource/:project_id/projects/:node_id/nodes/stop" do
  res = $gns3.node_stop(params[:project_id], params[:node_id])
  redirect to("/resource/#{params[:project_id]}/nodes")
end

get "/resource/:project_id/open" do
  res = $gns3.project_open(params[:project_id])
  redirect to("/resource")
end

get "/resource/:project_id/close" do
  res = $gns3.project_close(params[:project_id])
  redirect to("/resource")
end
