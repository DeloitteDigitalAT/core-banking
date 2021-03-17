import React from "react";

const SiteBody: React.FC = properties => {
  return <div className="max-w-6xl mx-auto px-2 md:px-4 flex flex-col min-h-screen">{properties.children}</div>;
};

export default SiteBody;
