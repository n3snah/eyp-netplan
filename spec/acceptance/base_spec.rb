require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'netplan class' do

  context 'basic setup' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      netplan::interface { 'enp0s3':
        dns       => [ '1.1.1.1', '8.8.8.8' ],
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe file('/etc/netplan/91-enp0s3.yaml') do
      it { should be_file }
      its(:content) { should match 'puppet managed file' }
    end

  end
end
