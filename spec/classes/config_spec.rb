# frozen_string_literal: true

require 'spec_helper'

describe 'netplan::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it do
        is_expected.to contain_file('/etc/netplan').with(
          'ensure' => 'directory',
          'owner' => 'root',
          'group' => 'root',
          'mode' => '0755',
          'recurse' => false,
          'purge' => false,
        )
      end

      context 'with dir_purge => true' do
        let(:params) do
          {
            'dir_purge' => true
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan').with(
            'ensure' => 'directory',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0755',
            'recurse' => true,
            'purge' => true,
          )
        end
      end

      context 'with dir_purge => false' do
        let(:params) do
          {
            'dir_purge' => false
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan').with(
            'ensure' => 'directory',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0755',
            'recurse' => false,
            'purge' => false,
          )
        end
      end
    end
  end
end
