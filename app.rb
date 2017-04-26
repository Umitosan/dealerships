require 'sinatra'
require 'sinatra/reloader'
require './lib/dealership'
require './lib/vehicle'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/vehicles') do
  @vehicles = Vehicle.all()
  @vehicles_list = Vehicle.all().length()
  erb(:vehicles)
end

get('/vehicles/new') do
  erb(:vehicles_form)
end

post('/vehicles_input') do
  make = params.fetch("make")
  model = params.fetch("model")
  year = params.fetch("year")
  vehicle = Vehicle.new(make, model, year)
  vehicle.save()
  @vehicles_list = Vehicle.all().length()
  erb(:success)
end

get('/vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch("id"))
  erb(:vehicle)
end
