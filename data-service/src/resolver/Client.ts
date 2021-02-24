import { Resolver, Root, FieldResolver, Ctx } from "type-graphql";
import { Account } from "../entity/Account";
import { Client } from "../entity/Client";

@Resolver(Client)
export class ClientResolver {
  @FieldResolver()
  async accounts(@Root() client: Client, @Ctx() { dataSources }: any): Promise<Account[]> {
    return dataSources.AccountsAPI.getAccounts(client.clientId);
  }
}
