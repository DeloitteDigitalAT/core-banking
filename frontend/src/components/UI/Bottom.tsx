import React from "react";

const Bottom: React.FC = () => {
  return (
    <div className="px-4 bg-green-100 text-gray-600 rounded text-md py-5 mt-6 w-full">
      &copy; {new Date().getFullYear()} Deloitte Digital{" "}
    </div>
  );
};

export default Bottom;
