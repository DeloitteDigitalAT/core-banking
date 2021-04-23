import React, { useState } from "react";
import { useHistory } from "react-router-dom";
import { Header, Tabs, Form } from "../UI";

const Main: React.FC = () => {
  const [tabsElements, setTabsElements] = useState([
    { name: "Search by Name", id: 1, active: true },
    { name: "Search by Application ID", id: 2, active: false },
  ]);
  const history = useHistory();
  const [formName, setFormName] = useState([
    {
      id: 1,
      type: "input",
      label: "First Name",
      placeholder: "John",
      value: "",
      required: false,
      readonly: false,
      error: false,
      divClass: "col-span-6 max-w-sm",
    },
    {
      id: 2,
      type: "input",
      label: "Last Name",
      placeholder: "Doe",
      value: "",
      required: true,
      readonly: false,
      error: false,
      divClass: "col-span-6 max-w-sm",
    },
    {
      id: 3,
      type: "button",
      text: "Search",
      handler: () => {},
      divClass: "col-span-6 max-w-sm",
    },
  ]);
  const [formID, setFormID] = useState([
    {
      id: 1,
      type: "input",
      label: "Application ID",
      placeholder: "123456",
      value: "",
      required: true,
      readonly: false,
      error: false,
      divClass: "col-span-6 max-w-sm",
    },
    {
      id: 3,
      type: "button",
      text: "Search",
      handler: () => {
        history.push(`/application/${formID[0].value}`);
      },
      divClass: "col-span-6",
    },
  ]);
  const activeTabId = tabsElements.find(el => el.active)?.id;
  return (
    <div className="flex-grow">
      <Header>Search customer application</Header>
      <Tabs elements={tabsElements} setElements={setTabsElements} />
      {activeTabId === 1 && <Form elements={formName} setForm={setFormName} />}
      {activeTabId === 2 && <Form elements={formID} setForm={setFormID} />}
    </div>
  );
};

export default Main;
