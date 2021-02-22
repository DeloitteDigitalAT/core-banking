import { Resolver, Root, FieldResolver } from "type-graphql";
import { Account } from "../entity/Account";
import { Client } from "../entity/Client";
import axios from "axios";
import { config } from "../config/config";

@Resolver(Client)
export class ClientResolver {
  @FieldResolver()
  async accounts(@Root() client: Client): Promise<Account[]> {
    let result = new Array<Account>();
    try {
      const response = await axios({
        method: "get",
        url: `${config.accounts.url}/clients/${client.clientId}/accounts`,
      });
      result = response.data;
    } catch (error) {
      throw new Error(error.response.data.message);
    }
    return result;
  }
}
