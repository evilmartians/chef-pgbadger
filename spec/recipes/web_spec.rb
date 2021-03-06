require_relative '../spec_helper'

describe 'pgbadger::web' do
  platform 'ubuntu', '18.04'

  override_attributes['postgresql']['defaults']['server']['version'] = '9.6'

  it 'should create passwd file anyway' do
    expect(chef_run).to create_template '/var/lib/postgresql/pg_reports/.passwd'
  end

  context 'with stubbed data_bag' do
    before do
      stub_data_bag('pgbadger_users').and_return(['bregor'])
      stub_data_bag_item('pgbadger_users', 'bregor')
        .and_return('id' => 'bregor', 'password' => 'abc123')
    end

    it 'stores users in passwd file' do
      expect(chef_run).to render_file('/var/lib/postgresql/pg_reports/.passwd')
        .with_content(/bregor.+/)
    end
  end
end
