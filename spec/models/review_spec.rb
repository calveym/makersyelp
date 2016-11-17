require 'rails_helper'

describe Review, type: :model do
  let!(:restaurant) {Restaurant.create(name: "Brian's Bagels",
                                    blurb: "Best Bagels in Town",
                                    description: "Bring you bootilicious self down for some brilliant Bagels",
                                    postcode: "TN327WE")
                                  }

  subject(:review) {Review.create(rating: 5, comment: "It's one of the best, the food is so fiery, the food is so great.", restaurant_id: restaurant.id) }


  describe 'record fields' do

    it 'has a rating' do
      expect(review.rating).to eq(5)
    end

    it 'has a comment' do
      expect(review.comment).to eq("It's one of the best, the food is so fiery, the food is so great.")
    end

    it 'has a restaurant id' do
      expect(review.restaurant_id).to eq 1
    end

  end

  describe 'validations' do

    it 'has to have a rating' do
      rev = Review.create(rating: nil, comment: 'best food', restaurant_id: 1)
      expect(rev).to_not be_valid
    end

    it "doesn't need a comment" do
      rev = Review.create(rating: 3, restaurant_id: 1)
      expect(rev).to be_valid
    end

    it "has a rating between 1 and 5" do
      rev = Review.create(rating: 6, restaurant_id: 1)
      expect(rev).to_not be_valid
      rev1 = Review.create(rating: 0, restaurant_id: 2)
      expect(rev1).to_not be_valid
    end

    it 'has to have a restaurant_id' do
      expect{Review.create(rating: 4, comment: 'best food', restaurant_id: nil)}.to change(Review, :count).by(0)
    end
  end

  describe 'belongs to relationship' do

    it 'should belong to a single restaurant' do
      rev = Review.reflect_on_association(:restaurant)
      expect(rev.macro).to eq :belongs_to
    end

  end


  
end
