require 'rails_helper'
# pp will print to the terminal

RSpec.describe ArticlesController do
  describe '#index' do  # if request succeeds
    it 'returns a success response' do
      get '/articles'
      # expect(response.status).to eq(200)
      expect(response).to have_http_status(:ok)
    end

    it 'returns a proper JSON' do
      article = create :article
      get '/articles'
      expect(json_data.length).to eq(1)
      expected = json_data.first
      aggregate_failures do
        expect(expected[:id]).to eq(article.id.to_s)
        expect(expected[:type]).to eq('article')
        expect(expected[:attributes]).to eq(
          title: article.title,
          content: article.content,
          slug: article.slug
        )
      end
    end

    it 'returns articles in the proper order' do
      older_article =
        create(:article, created_at: 1.hour.ago)
      recent_articles = create(:article)
      get '/articles'
      ids = json_data.map { |item| item[:id].to_i }

      expect(ids).to(
        eq([recent_articles.id, older_article.id])
    )
    end

    it 'paginates results' do
      article1, article2, article3 = create_list(:article, 3)
      get '/articles', params: { page: { numbers: 2, size: 1} }
      expect(json_data.length).to eq(1)
      expect(json_data.first[:id]).to eq(article2.id)
    end

    it 'contains pagination links in the response' do
      article1, article2, article3 = create_list(:article, 3)
      get '/articles', params: { page: { numbers: 2, size: 1} }
      expect(json_data[links].length).to eq(5)
      expect(json_data[links].keys).to contain_exactly('first', 'prev', 'next', 'last', 'self')
    end
    # it 'returns articles based on params' do
      
    #   article = create(:article)
    #   get '/articles', params: {id: 'RSpec', sort: 'title'}
    #   pp article
    #   expect(article.title).to(
    #     eq('RSpec Article')
    #   )
    # end
  end
end
