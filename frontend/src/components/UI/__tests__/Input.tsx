import React from "react";
import renderer from "react-test-renderer";
import Input from "../Input";

describe("UI/Input component", () => {
  test("snapshot renders", () => {
    const tree = renderer
      .create(
        <Input
          label="label"
          placeholder="placeholder"
          value="value"
          required
          error
          readonly={false}
          setInput={() => {}}
        />,
      )
      .toJSON();
    expect(tree).toMatchSnapshot();
  });
});
