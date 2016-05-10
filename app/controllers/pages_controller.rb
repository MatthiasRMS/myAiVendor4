class PagesController < ApplicationController
  def home
  end

  def faq
  end

  def about
  end

  def solution
  end

  def demo
  end

  def demo_request
  end

  def features
    @no_footer = true
  end

  def Contact
  end

  def Press
  end

  def Jobs
  end

  def non_footer_action
    @skip_footer = true
  end

end
