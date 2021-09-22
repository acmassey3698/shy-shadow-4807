require 'rails_helper'

RSpec.describe 'plots index' do
  before :each do
    @garden = Garden.create!(name: "Turing Garden", organic: true)
    @garden2 = Garden.create!(name: 'Andrews Garden', organic: false)

    @plot1 = @garden.plots.create!(number: 1, size: 'small', direction: 'ENE' )
    @plot2 = @garden.plots.create!(number: 2, size: 'small', direction: 'E')
    @plot3 = @garden2.plots.create!(number: 3, size: 'medium', direction: 'SW')
    @plot4 = @garden2.plots.create!(number: 4, size: 'large', direction: 'NW')

    @plant1 = Plant.create(name: 'Peppers', description: 'sometimes its spicy', days_to_harvest: 100)
    @plant2 = Plant.create(name: 'Tomato', description: 'Ew', days_to_harvest: 20)
    @plant3 = Plant.create(name: 'Pumpkin', description: 'big and orange', days_to_harvest: 15)
    @plant4 = Plant.create(name: 'Grapes', description: 'make some wine?', days_to_harvest: 60)

    PlantPlot.create!(plant: @plant1, plot: @plot1)
    PlantPlot.create!(plant: @plant2, plot: @plot1)
    PlantPlot.create!(plant: @plant3, plot: @plot1)
    PlantPlot.create!(plant: @plant4, plot: @plot2)
    PlantPlot.create!(plant: @plant1, plot: @plot3)
    PlantPlot.create!(plant: @plant2, plot: @plot4)

    visit '/plots'
  end

  it 'shows all the plots by number and shows that plots plants' do
    within "#plot-#{@plot1.id}" do
      save_and_open_page
      
      expect(page).to have_content(@plot1.number)

      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant3.name)
    end

    within "#plot-#{@plot2.id}" do
      expect(page).to have_content(@plot2.number)

      expect(page).to have_content(@plant4.name)
    end

    within "#plot-#{@plot3.id}" do
      expect(page).to have_content(@plot3.number)

      expect(page).to have_content(@plant1.name)
    end

    within "#plot-#{@plot4.id}" do
      expect(page).to have_content(@plot4.number)

      expect(page).to have_content(@plant2.name)
    end
  end
end
