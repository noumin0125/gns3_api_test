#!/usr/bin/ruby

require 'net/http'
require 'json'
require 'uri'

class Gns3
  def initialize(gns3_url)
    @base_url = gns3_url
  end

  def projects
    res = JSON.parse(Net::HTTP.get(URI.parse("#{@base_url}/projects")))
  end

  def nodes(project_id)
    res = JSON.parse(Net::HTTP.get(URI.parse("#{@base_url}/projects/#{project_id}/nodes")))
  end

  def node(project_id, node_id)
    res = JSON.parse(Net::HTTP.get(URI.parse("#{@base_url}/projects/#{project_id}/nodes/#{node_id}")))
  end

  def project_open(project_id)
    res = Net::HTTP.post_form(URI.parse("#{@base_url}/projects/#{project_id}/open"),{})
  end

  def project_close(project_id)
    res = Net::HTTP.post_form(URI.parse("#{@base_url}/projects/#{project_id}/close"),{})
  end

  def node_start(project_id, node_id)
    res = Net::HTTP.post_form(URI.parse("#{@base_url}/projects/#{project_id}/nodes/#{node_id}/start"),{})
  end

  def node_stop(project_id, node_id)
    res = Net::HTTP.post_form(URI.parse("#{@base_url}/projects/#{project_id}/nodes/#{node_id}/stop"),{})
  end
end
