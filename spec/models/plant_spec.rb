require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe "relationships" do
    it {should have_many(:plant_plots)}
    it {should have_many(:plots).through(:plant_plots)}
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

    @pp1 = PlantPlot.create!(plant: @plant1, plot: @plot1)
    @pp2 = PlantPlot.create!(plant: @plant2, plot: @plot1)
    @pp3 = PlantPlot.create!(plant: @plant3, plot: @plot1)
    @pp4 = PlantPlot.create!(plant: @plant4, plot: @plot2)
    @pp5 = PlantPlot.create!(plant: @plant4, plot: @plot2)
    @pp6 = PlantPlot.create!(plant: @plant1, plot: @plot3)
    @pp7 = PlantPlot.create!(plant: @plant2, plot: @plot4)
  end

  describe 'instance methods' do
    describe '#find_plant_plot' do
      it 'return the correct plant plot when given a plot id' do
        expect(@plant1.find_plant_plot(@plot1)).to eq(@pp1)
      end
    end
  end
end
