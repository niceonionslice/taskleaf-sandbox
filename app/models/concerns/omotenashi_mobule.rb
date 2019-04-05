# models/concerns/配下にはmodelで共通で利用するようなmoduleを定義する。
module OmotenashiMobule
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def kokoro
      puts 'foo'
    end
  end

  def service
    puts 'bar'
  end
end
