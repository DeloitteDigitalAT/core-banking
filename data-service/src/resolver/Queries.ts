import { Resolver, Query, Arg, Ctx } from "type-graphql";
import { Transaction } from "../entity/Transaction";
import { Account } from "../entity/Account";
import { Client } from "../entity/Client";

@Resolver()
export class QueriesResolver {
  @Query(() => Client)
  async client(@Arg("id") clientId: string, @Ctx() { dataSources }: any): Promise<Client> {
    return dataSources.AccountsAPI.getClient(clientId);
  }

  @Query(() => [Account])
  async accounts(@Arg("clientId") clientId: string, @Ctx() { dataSources }: any): Promise<Account[]> {
    return dataSources.AccountsAPI.getAccounts(clientId);
  }

  @Query(() => [Transaction])
  async transactions(@Arg("accountId") accountId: number, @Ctx() { dataSources }: any): Promise<Transaction[]> {
    return dataSources.TransactionsAPI.getTransactions(accountId);
  }
}
