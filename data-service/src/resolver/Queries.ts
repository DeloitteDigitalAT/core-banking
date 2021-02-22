import { Resolver, Query, Arg } from "type-graphql";
import { Transaction } from "../entity/Transaction";
import { Account } from "../entity/Account";
import { Client } from "../entity/Client";
import axios from "axios";
import { config } from "../config/config";

@Resolver()
export class QueriesResolver {
  @Query(() => Client)
  async client(@Arg("id") id: string): Promise<Client> {
    let result = new Client();
    try {
      const response = await axios({
        method: "get",
        url: `${config.accounts.url}/clients/${id}`,
      });
      result = response.data;
    } catch (error) {
      throw new Error(error.response.data.message);
    }
    return result;
  }

  @Query(() => [Account])
  async accounts(@Arg("clientId") clientId: string): Promise<Account[]> {
    let result = new Array<Account>();
    try {
      const response = await axios({
        method: "get",
        url: `${config.accounts.url}/clients/${clientId}/accounts`,
      });
      result = response.data;
    } catch (error) {
      throw new Error(error.response.data.message);
    }
    return result;
  }

  @Query(() => [Transaction])
  async transactions(@Arg("accountId") accountId: number): Promise<Transaction[]> {
    let result = new Array<Transaction>();
    try {
      const response = await axios({
        method: "get",
        url: `${config.transactions.url}/transactions`,
        params: {
          accountId,
        },
      });
      result = response.data;
    } catch (error) {
      throw new Error(error.response.data.message);
    }
    return result;
  }
}
