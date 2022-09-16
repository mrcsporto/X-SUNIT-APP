class AbductionsController < ApplicationController
  include AbductionsHelper

  def index
    @survivors = Survivor.all
    @survivors = Survivor.where(:abducted => true).order('name ASC')
  end  

end