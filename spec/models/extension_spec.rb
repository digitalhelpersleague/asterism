require 'rails_helper'

RSpec.describe ::Extension, type: :model do
  it 'is invalid without a context, app, appdata, priority attributes' do
    expect(::Extension.new).not_to be_valid
    expect(::Extension.new).to have(1).errors_on(:context, :app, :appdata)
  end

  it 'creates new variable for existing extension' do
    extension = create(:extension)
    expect(extension).to be_persisted
  end

  it 'creates new variable for existing extension' do
    extension = create(:extension)
    extension.add_variable({ foo: 'bar' })
    # expect(extension.save).to be_persisted
    expect(extension.variables).to be_persisted
  end

  it 'creates extension with new variable ' do
    extension = create(:extension, variables: [{ foo: 'bar' }])
    expect(extension).to be_persisted
    expect(extension.variables.first).to be_persisted
  end

  it 'sets GoTo to setvariables function for newly created extension' do
    extension = create(:extension, variables: [{foo: 'bar'}])
    variable = create(:variable, extension: extension)
    variable.ancestor
    goto_object = extension.relatives_dataset.where('FIND GOTO EXTENSION').first
    expect(goto_object.descendant)
  end

  it 'sets default attributes for new extension' do
    extension = create(:ivr)
    expect(extension).to be_persisted
    # expect(extension.attributes).to be_
    # expect(extension.variables).to be_persisted
  end

  #it 'present list and topic' do
    #list = create(:list)

    #expect(list.topics.any?).to be_truthy
    #expect(list.topics.first.lists.any?).to be_truthy
  #end
end
