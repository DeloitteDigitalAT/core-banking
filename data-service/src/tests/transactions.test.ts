import "reflect-metadata";
import { rest } from "msw";
import { setupServer } from "msw/node";
import { gql } from "apollo-server";
import { createTestClient } from "apollo-server-testing";
import { config } from "../config/config";
import transactionsMock from "./mock/transactions.json";
import { createServer } from "../utils/createServer";

const mockServer = setupServer(
  rest.get(`${config.transactions.url}/transactions`, (_req, res, ctx) => res(ctx.json(transactionsMock))),
);

beforeAll(() => mockServer.listen());
afterEach(() => mockServer.resetHandlers());
afterAll(() => mockServer.close());

test("test Transactions schema and resolver", async () => {
  const server = await createServer();

  const { query } = createTestClient(server);
  const { data } = await query({
    query: gql`
      {
        transactions(accountId: 12286356) {
          accountId
          accountIban
          type
          amount
          balance
          amount
          transId
        }
      }
    `,
  });
  expect(data).toEqual({ transactions: transactionsMock });
});
