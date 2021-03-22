import React from "react";

const Content: React.FC = properties => {
  return <div className="px-4 flex-grow">{properties.children}</div>;
};

export default Content;
