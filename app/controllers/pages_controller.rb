class PagesController < ApplicationController
  caches_page :home, :faq

  def home; end
  def faq; end
end
