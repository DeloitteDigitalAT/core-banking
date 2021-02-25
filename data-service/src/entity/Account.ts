import { ObjectType, Field } from "type-graphql";
import { Transaction } from "./Transaction";

@ObjectType()
export class Account {
  @Field()
  accountId: string;

  @Field()
  frequency: string;

  @Field()
  createDate: string;

  @Field(() => [Transaction])
  transactions: Transaction[];
}
