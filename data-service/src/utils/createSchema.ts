import { buildSchema } from "type-graphql";
import { ClientResolver } from "../resolver/Client";
import { AccountResolver } from "../resolver/Account";
import { QueriesResolver } from "../resolver/Queries";

import { GraphQLSchema } from "graphql";

export const createSchema = (): Promise<GraphQLSchema> =>
  buildSchema({
    resolvers: [AccountResolver, ClientResolver, QueriesResolver],
  });
