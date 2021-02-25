import { RESTDataSource } from "apollo-datasource-rest";
import { config } from "../config/config";
import { Account } from "../entity/Account";
import { Client } from "../entity/Client";

export default class AccountsAPI extends RESTDataSource {
  constructor() {
    super();
    this.baseURL = config.accounts.url;
  }

  async getAccounts(clientId: string): Promise<Account[]> {
    return this.get(`/clients/${clientId}/accounts`);
  }

  async getClient(clientId: string): Promise<Client> {
    return this.get(`/clients/${clientId}`);
  }
}
