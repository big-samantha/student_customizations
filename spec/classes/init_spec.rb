require 'spec_helper'
describe 'student_customizations' do

  context 'with defaults for all parameters' do
    it { should contain_class('student_customizations') }
  end
end
