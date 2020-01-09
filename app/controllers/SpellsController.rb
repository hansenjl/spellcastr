class SpellsController < ApplicationController

  get '/spells' do
    @spells = Spell.all
    erb :'spells/index'
  end

  get '/spells/new' do
    erb :'spells/new'
  end

  get '/spells/:id' do
    @spell = Spell.find_by(id: params[:id])
    # if spell (if the spell even exists...)
    # else
    # end
    erb :'spells/show'
  end

  post '/spells' do
    spell = Spell.create(params[:spell])
    redirect "/spells/#{spell.id}"
    # if spell.save
    # else
    # end
  end

  get '/spells/:id/edit' do
    @spell = Spell.find_by(id: params[:id])
    erb :'spells/edit'
  end

  put '/spells/:id' do
    spell = Spell.find_by(id: params[:id])
    spell.update(params[:spell])
    redirect "/spells/#{spell.id}"
  end

  delete '/spells/:id' do
    spell = Spell.find_by(id: params[:id])
    redirect "/spells"
  end

end
