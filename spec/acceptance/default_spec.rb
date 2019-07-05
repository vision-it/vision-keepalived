require 'spec_helper_acceptance'

describe 'vision_keepalived' do
  context 'with defaults' do
    it 'run idempotently' do
      pp = <<-FILE
        class { 'vision_keepalived': }
      FILE

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: false)
    end
  end

  context 'packages installed' do
    describe package('keepalived') do
      it { is_expected.to be_installed }
    end
  end

  context 'test config deployed' do
    describe file('/etc/keepalived/keepalived.conf') do
      it { is_expected.to exist }
      its(:content) { is_expected.to match 'foobar' }
    end
  end
end
