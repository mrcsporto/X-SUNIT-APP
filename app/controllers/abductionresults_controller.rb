class AbductionresultsController < ApplicationController
  include AbductionresultsHelper

  def index
    @survivors = Survivor.all
    @survivors = Survivor.where(:abducted => true).order('name ASC')
  end  

end