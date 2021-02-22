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

    # pending 'has an invalid content'

    # pending 'has an invalid slug'

    # pending 'validates the uniqueness of the slug'
    # create article with a slug
    # check if it's valid
    # create a second article with the same slug
    # check if it's invalid
	end
end

