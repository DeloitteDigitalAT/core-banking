import { RESTDataSource } from "apollo-datasource-rest";
import { config } from "../config/config";
import { Transaction } from "../entity/Transaction";

export default class TransactionsAPI extends RESTDataSource {
  constructor() {
    super();
    this.baseURL = config.transactions.url;
  }

  async getTransactions(accountId: number): Promise<Transaction[]> {
    return this.get(`/transactions`, { accountId });
  }
}
