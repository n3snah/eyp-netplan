# frozen_string_literal: true

require 'spec_helper'

describe 'netplan::interface' do
  let(:title) { 'eth0' }
  let(:params) do
    {}
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it do
        is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
          'ensure' => 'present',
          'owner' => 'root',
          'group' => 'root',
          'mode' => '0644',
          'notify' => 'Exec[netplan apply]',
        )
      end
    end
  end
end
