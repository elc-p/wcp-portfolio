class SearchesController < ApplicationController

  def search
    words = params[:word]
    tags = []
    searchwords = []
    tags, searchwords = lookfor(words)
    p "==================="
    p "結果確認"
    p tags
    p tags.empty?
    p searchwords
    p "==================="
    if tags.empty?
      # @result = Prefecture.where(name: searchwords) || City.where(name: searchwords) || Post.where(body: searchwords)
    elsif serchwords.empty?
      # @result = Tag.where(name: tags)
    else
      # @result = Tag.where(name: tags) || Prefecture.where(name: searchwords) || City.where(name: searchwords) || Post.where(body: searchwords)
    end

    p "==================="
    p "結果確認"
    p @result
    p "==================="

  end


  private

  def lookfor(searchwords)
    words = searchwords.split(nil)
    tags = []
    lookwords = []
    words.each do |word|
      if word[0,1] == "#"
        tags.push(word.slice!(1, word.length))
      else
        lookwords.push(word)
      end
    end

    return tags, lookwords

  end

end
