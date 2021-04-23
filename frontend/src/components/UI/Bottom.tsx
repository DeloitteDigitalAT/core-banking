import React from "react";

const Bottom: React.FC = () => {
  return (
    <div className="px-4 text-gray-600 bg-gradient-to-b from-green-100 via-green-200 to-green-200 rounded text-sm py-5 mt-6 w-full">
      &copy; {new Date().getFullYear()} Deloitte Digital{" "}
    </div>
  );
};

export default Bottom;
