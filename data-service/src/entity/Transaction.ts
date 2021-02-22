import { ObjectType, Field } from "type-graphql";

@ObjectType()
export class Transaction {
  @Field()
  accountId: string;

  @Field()
  accountIban: string;

  @Field()
  type: string;

  @Field()
  amount: number;

  @Field()
  balance: number;

  @Field()
  transId: number;
}
