require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validations' do
    it 'should test that factory is valid' do
			expect(build :article).to be_valid
		end

		it 'should validate the presence of a title' do
			article = build :article, title: ''
			expect(article).not_to be_valid
			expect(article.errors.messages[:title]).to include("can't be blank")
		end

     it 'should validate the presence of a content' do
      article = build :article, content: ''
      expect(article).not_to be_valid
      expect(article.errors.messages[:content]).to include("can't be blank")
    end
  	
     it 'should validate the presence of a slug' do
      article = build :article, slug: ''
      expect(article).not_to be_valid
      expect(article.errors.messages[:slug]).to include("can't be blank")
  		end
	 
		it 'should validate uniqueness of slug' do
			article = create :article
			invalid_article = build :article, slug: article.slug
			expect(invalid_article).not_to be_valid
    end

    it 'test a number is positive' do
      expect(1).to be_positive
      expect(5).to be > 3
    end

    it 'test article object' do
      article = build(:article)
      expect(article.title).to eq('Sample title')
    end

    it 'has an invalide title' do 
      article = build(:article, title: '')
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end
  end

  describe '.recent' do
    it 'returns articles in the correct order' do
      older_article = 
        create(:article, created_at: 1.hour.ago)
      recent_article = create(:article)

      expect(describe_class.recent).to eq(
        [recent_article, older_article]
      )

      recent_article.update_column(:created_at, 2.hours.ago)

      expect(describe_class.recent).to eq(
        [older_article, recent_article]
      )
    end
  end
end

