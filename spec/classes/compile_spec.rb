require 'spec_helper'
require 'hiera'

describe 'vision_keepalived' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end
      # Default check to see if manifest compiles
      context 'compile' do
        it { is_expected.to compile.with_all_deps }
      end
      context 'test config included' do
        it { is_expected.to contain_file('/etc/keepalived/keepalived.conf') }
      end
    end
  end
end
