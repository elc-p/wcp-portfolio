class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    words = params[:word]
    tags = []
    searchwords = []
    @result = []
    tags, searchwords = lookfor(words)
    if tags.empty?
      # @resutl.push(lookbyPrefecture(searchwords))
      # @result.push(lookbyCity(searchwords))
      unless lookbyPrefecture(searchwords) == []
        @result += lookbyPrefecture(searchwords)
      end
      unless lookbyCity(searchwords) == []
        @result += lookbyCity(searchwords)
      end
      unless lookbyPost(searchwords) == []
        @result += lookbyPost(searchwords)
      end
    elsif searchwords.empty?
      unless lookbyTag(tags) == []
        @result += lookbyTag(tags)
      end
    else
      unless lookbyTag(tags) == []
        @result += lookbyTag(tags)
      end
      unless lookbyPrefecture(searchwords) == []
        @result += lookbyPrefecture(searchwords)
      end
      unless lookbyCity(searchwords) == []
        @result += lookbyCity(searchwords)
      end
      unless lookbyPost(searchwords) == []
        @result += lookbyPost(searchwords)
      end
      
    end
    @result = @result.uniq


  end


  private

  def lookfor(searchwords)
    words = searchwords.split(nil)
    tags = []
    lookwords = []
    words.each do |word|
      if word[0,1] == "#"
        tags += [word.slice!(1, word.length)]
      else
        lookwords += [word]
      end
    end

    return tags, lookwords

  end

  def lookbyPrefecture(words)
    result = []
    prefectures = []
    words.each do |word|
      prefectures += Prefecture.where("name LIKE ?", "%#{word}%")
    end
    prefectures.each do |prefecture|
      result += Post.where(prefecure: prefecture.name)
    end
  end

  def lookbyCity(words)
    result = []
    cities = []
    words.each do |word|
      cities += City.where("name LIKE ?", "%#{word}%")
    end
    cities.each do |city|
      result += Post.where(cities: city.name)
    end
    return result
  end

  def lookbyPost(words)
    result = []
    words.each do |word|
      result += Post.where("body LIKE ?", "%#{word}%")
    end
    return result
  end

  def lookbyTag(words)
    result = []
    tags = []
    taggings = []
    words.each do |word|
      tags += Tag.where("category LIKE ?", "%#{word}%")
    end
    tags.each do |tag|
      taggings += Tagging.where(tag_id: tag.id)
    end
    taggings.each do |tagging|
      result += [Post.find(tagging.post_id)]
    end
    return result

  end




end
