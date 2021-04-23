import React, { useState } from "react";
import { Accordion, Documents, Form, Header, SmallButton } from "../UI";
import img1 from "../../assets/images/Id.jpeg";
import img2 from "../../assets/images/Payslip.jpg";
import img3 from "../../assets/images/Meldezettel.png";

const mockData = [
  {
    client_id: 1,
    created_date: "2021-03-08",
    first_name: "Judy",
    last_name: "Green",
    date_of_birth: "1970-11-03",
    social_security_number: "377-82-5154",
    gender: "F",
    marital_status: "Engaged",
    residential_status: "With Family",
    citizenship: "Turkmenistan",
    address_details_id: 8,
    house_no: 701,
    street_name: "898 Cynthia Inlet",
    city: "Graz",
    postal_code: 1200,
    phone_number: "(930)544-3449x587",
    mobile_number: null,
    email_id: "judy.green@gmail.com",
    employment_status: "Selfemployed",
    annual_income: 84000.0,
    employed_years: 17,
    position: "Selfemployed",
    company_employed: "N/A",
    credit_amount: 76000.0,
    interest_rate: 0.68,
    planned_emi: 3209.73,
    duration_in_months: 24,
    files: [
      {
        document_list_id: 1,
        name: "ID",
        description: "Identity Card",
        location_url: img1,
        category: "ID",
        created_date: "2021-03-08",
      },
      {
        document_list_id: 21,
        name: "Payslip1",
        description: "Payslip for month 1",
        location_url: img2,
        category: "Payslip",
        created_date: "2021-03-08",
      },
      {
        document_list_id: 41,
        name: "Payslip2",
        description: "Payslip for month 2",
        location_url: img2,
        category: "Payslip",
        created_date: "2021-03-08",
      },
      {
        document_list_id: 61,
        name: "Payslip3",
        description: "Payslip for month 3",
        location_url: img2,
        category: "Payslip",
        created_date: "2021-03-08",
      },
      {
        document_list_id: 81,
        name: "Meldezettel",
        description: "Address proof",
        location_url: img3,
        category: "Meldezettel",
        created_date: "2021-03-08",
      },
    ],
  },
];

interface ApplicationType {
  applicationID: string;
}

const Application: React.FC<ApplicationType> = properties => {
  const { applicationID } = properties;
  const application = mockData[0];
  const [personalData, setPersonalData] = useState([
    {
      id: 1,
      type: "input",
      label: "First Name",
      placeholder: "",
      value: application.first_name,
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-6 md:col-span-3",
    },
    {
      id: 2,
      type: "input",
      label: "Last Name",
      placeholder: "",
      value: application.last_name,
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-6 md:col-span-3 md:pl-4",
    },
    {
      id: 3,
      type: "input",
      label: "Date of birth",
      placeholder: "",
      value: application.date_of_birth,
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-2 md:col-start-1 col-span-1",
    },
    {
      id: 4,
      type: "input",
      label: "Gender",
      placeholder: "",
      value: application.gender,
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-1 pl-4",
    },
    {
      id: 5,
      type: "input",
      label: "Social security number",
      placeholder: "",
      value: application.social_security_number ? `${application.social_security_number}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-3 pl-4",
    },
    {
      id: 6,
      type: "input",
      label: "Citizenship",
      placeholder: "",
      value: application.citizenship ? `${application.citizenship}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-6",
    },
    {
      id: 7,
      type: "input",
      label: "Marital status",
      placeholder: "",
      value: application.marital_status ? `${application.marital_status}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-3",
    },
    {
      id: 8,
      type: "input",
      label: "Residential status",
      placeholder: "",
      value: application.residential_status ? `${application.residential_status}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-3 pl-4",
    },
  ]);
  const [address, setAddress] = useState([
    {
      id: 1,
      type: "input",
      label: "Address",
      placeholder: "",
      value: `${application.postal_code}, ${application.city}, ${application.street_name}, ${application.house_no}`,
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-6",
    },
    {
      id: 2,
      type: "input",
      label: "Phone number",
      placeholder: "",
      value: application.phone_number ? `${application.phone_number}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-6 md:col-span-2",
    },
    {
      id: 3,
      type: "input",
      label: "Mobile number",
      placeholder: "",
      value: application.mobile_number ? `${application.mobile_number}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-6 md:col-span-2 md:pl-4",
    },
    {
      id: 4,
      type: "input",
      label: "Email",
      placeholder: "",
      value: application.email_id ? `${application.email_id}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-6 md:col-span-2 md:pl-4",
    },
  ]);
  const [employmentStatus, setEmploymentStatus] = useState([
    {
      id: 1,
      type: "input",
      label: "Employment status",
      placeholder: "",
      value: application.employment_status ? `${application.employment_status}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-6 md:col-span-2",
    },
    {
      id: 2,
      type: "input",
      label: "Annual income (Euro)",
      placeholder: "",
      value: application.annual_income ? `${application.annual_income}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-3 md:col-span-2 md:pl-4",
    },
    {
      id: 3,
      type: "input",
      label: "Employed years",
      placeholder: "",
      value: application.employed_years ? `${application.employed_years}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-3 md:col-span-2 pl-4",
    },
    {
      id: 4,
      type: "input",
      label: "Position",
      placeholder: "",
      value: application.position ? `${application.position}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-6 md:col-span-3",
    },
    {
      id: 5,
      type: "input",
      label: "Company employed",
      placeholder: "",
      value: application.company_employed ? `${application.company_employed}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-6 md:col-span-3 md:pl-4",
    },
  ]);
  const [creditInfo, setCreditInfo] = useState([
    {
      id: 1,
      type: "input",
      label: "Credit amount requested",
      placeholder: "",
      value: application.credit_amount ? `${application.credit_amount}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-3 md:col-span-2",
    },
    {
      id: 2,
      type: "input",
      label: "Interest rate",
      placeholder: "",
      value: application.interest_rate ? `${application.interest_rate}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-3 md:col-span-1 pl-4",
    },
    {
      id: 3,
      type: "input",
      label: "Planned emi",
      placeholder: "",
      value: application.planned_emi ? `${application.planned_emi}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-3 md:col-span-1 md:pl-4",
    },
    {
      id: 4,
      type: "input",
      label: "Duration in months",
      placeholder: "",
      value: application.duration_in_months ? `${application.duration_in_months}` : "",
      required: false,
      readonly: true,
      error: false,
      divClass: "col-span-3 md:col-span-2 pl-4",
    },
  ]);
  const [openAll, setOpenAll] = useState(1);
  return (
    <div className="flex-grow mb-4">
      <Header>Application ID: {applicationID}</Header>
      <div className="grid grid-cols-6 mb-2 text-sm">
        <div className="col-span-3">Creation date: {application.created_date}</div>
        <div className="col-span-3 text-right">
          <SmallButton text="open all" handler={() => setOpenAll(openAll > 0 ? openAll + 1 : openAll * -1)} active />
          <SmallButton
            text="close all"
            handler={() => setOpenAll(openAll > 0 ? openAll * -1 : openAll - 1)}
            active
            extraClass="ml-2"
          />
        </div>
      </div>
      <Accordion label="Personal data" color="pacific" open={openAll}>
        <Form elements={personalData} setForm={() => setPersonalData} />
      </Accordion>
      <Accordion label="Address" color="pacific" open={openAll}>
        <Form elements={address} setForm={() => setAddress} />
      </Accordion>
      <Accordion label="Employment status" color="pacific" open={openAll}>
        <Form elements={employmentStatus} setForm={() => setEmploymentStatus} />
      </Accordion>
      <Accordion label="Credit information" color="pacific" open={openAll}>
        <Form elements={creditInfo} setForm={() => setCreditInfo} />
      </Accordion>
      <Accordion label="Documents" color="pacific" open={openAll}>
        <Documents documents={application.files} />
      </Accordion>
    </div>
  );
};

export default Application;
