require 'rails_helper'

RSpec.describe 'garden show page' do
  before :each do
    @garden = Garden.create!(name: "Turing Garden", organic: true)
    @garden2 = Garden.create!(name: 'Andrews Garden', organic: false)

    @plot1 = @garden.plots.create!(number: 1, size: 'small', direction: 'ENE' )
    @plot2 = @garden.plots.create!(number: 2, size: 'small', direction: 'E')
    @plot3 = @garden2.plots.create!(number: 3, size: 'medium', direction: 'SW')
    @plot4 = @garden2.plots.create!(number: 4, size: 'large', direction: 'NW')

    @plant1 = Plant.create(name: 'Peppers', description: 'sometimes its spicy', days_to_harvest: 50)
    @plant2 = Plant.create(name: 'Tomato', description: 'Ew', days_to_harvest: 20)
    @plant3 = Plant.create(name: 'Pumpkin', description: 'big and orange', days_to_harvest: 15)
    @plant4 = Plant.create(name: 'Grapes', description: 'make some wine?', days_to_harvest: 60)

    PlantPlot.create!(plant: @plant1, plot: @plot1)
    PlantPlot.create!(plant: @plant2, plot: @plot1)
    PlantPlot.create!(plant: @plant3, plot: @plot1)
    PlantPlot.create!(plant: @plant4, plot: @plot2)
    PlantPlot.create!(plant: @plant4, plot: @plot2)
    PlantPlot.create!(plant: @plant1, plot: @plot3)
    PlantPlot.create!(plant: @plant2, plot: @plot4)
  end

  it 'lists all the plants that are in the garden' do
    visit "/gardens/#{@garden.id}"
    save_and_open_page

    expect(page).to have_content(@garden.name)
    expect(page).to have_content(@plant1.name, count: 1)
    expect(page).to have_content(@plant2.name, count: 1)
    expect(page).to have_content(@plant3.name, count: 1)
    expect(page).to have_content(@plant4.name, count: 1)
  end
end
