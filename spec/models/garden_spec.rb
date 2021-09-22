require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

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

  describe 'instance methods' do
    describe '#harvestable_in_hundred' do
      it 'returns a distinct list of plants harvestable in less than 100 days' do
        
        expect(@garden.harvestable_in_hundred).to eq([@plant1, @plant2, @plant3, @plant4])
      end
    end
  end
end
