require 'spec_helper'

describe Pelada do
  it "should be instantiated" do

    p = Pelada.new

    p.data = DateTime.new
    p.local = 'copacabana'
    p.minimo_pessoas = 10
    p.responsavel = 'foo@bar.com'

    p.save!

    expect(Pelada.where(local:'copacabana',minimo_pessoas: 10).take).not_to eq nil


  end
end
