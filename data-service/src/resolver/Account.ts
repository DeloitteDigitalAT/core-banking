import { Resolver, Root, FieldResolver } from "type-graphql";
import { Transaction } from "../entity/Transaction";
import { Account } from "../entity/Account";
import axios from "axios";
import { config } from "../config/config";

@Resolver(Account)
export class AccountResolver {
  @FieldResolver()
  async transactions(@Root() account: Account): Promise<Transaction[]> {
    let result = new Array<Transaction>();
    try {
      const response = await axios({
        method: "get",
        url: `${config.transactions.url}/transactions`,
        params: {
          accountId: account.accountId,
        },
      });
      result = response.data;
    } catch (error) {
      throw new Error(error.response.data.message);
    }
    return result;
  }
}
