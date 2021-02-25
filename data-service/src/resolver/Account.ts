import { Resolver, Root, FieldResolver, Ctx } from "type-graphql";
import { Transaction } from "../entity/Transaction";
import { Account } from "../entity/Account";

@Resolver(Account)
export class AccountResolver {
  @FieldResolver()
  async transactions(@Root() account: Account, @Ctx() { dataSources }: any): Promise<Transaction[]> {
    return dataSources.TransactionsAPI.getTransactions(account.accountId);
  }
}
