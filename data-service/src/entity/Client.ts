import { ObjectType, Field } from "type-graphql";
import { Account } from "./Account";

@ObjectType()
export class Client {
  @Field()
  firstName: string;

  @Field()
  lastName: string;

  @Field()
  socialSecurityNumber: number;

  @Field()
  sex: string;

  @Field()
  dateOfBirth: string;

  @Field()
  clientId: string;

  @Field(() => [Account])
  accounts: Account[];
}
