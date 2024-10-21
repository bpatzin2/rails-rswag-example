require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'saving' do
    it 'saves successfully with valid attributes' do
      project = Project.new(name: 'Test Project')
      expect(project.save).to be true
    end

    it 'does not save with invalid attributes' do
      project = Project.new(name: nil)
      expect(project.save).to be false
    end
  end
end