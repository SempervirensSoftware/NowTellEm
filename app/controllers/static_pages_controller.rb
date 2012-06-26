
class StaticPagesController < ApplicationController
  def about
    @content = "Have you ever wanted to give candid, constructive feedback to a coworker but were unable to because of company culture, not wanting to sour relationships, or unwillingness to offend? <br/><br/> NowTellEm lets you anonymously share what you've been thinking so your coworkers can improve themselves for you!".html_safe
  end
end
