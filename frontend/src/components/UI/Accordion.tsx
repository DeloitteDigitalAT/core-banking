import React, { useState, useEffect } from "react";

interface AccordionType {
  label: string;
  color?: string;
  open?: number;
}

const Accordion: React.FC<AccordionType> = properties => {
  const { label, color, open } = properties;
  const [isOpen, setIsOpen] = useState(open && open > 0);
  useEffect(() => {
    setIsOpen(open && open > 0);
  }, [open]);
  return (
    <div>
      <div
        className={`grid grid-cols-6 -mx-4 border-l-2 block bg-opacity-30 uppercase tracking-wide text-xs font-semibold text-green-800 pl-4
        py-2 cursor-pointer ${
          color
            ? `border-${color}-200 bg-gradient-to-r from-${color}-100 to-${color}-50 hover:from-${color}-200 hover:to-${color}-100`
            : "border-pacific-200 bg-gradient-to-r from-pacific-100 to-pacific-50 hover:from-pacific-200 hover:to-pacific-100"
        }`}
        onClick={() => setIsOpen(!isOpen)}
      >
        <div className="col-span-5 pt-1">{label}</div>
        <div
          className={`col-span-1 w-6 h-6 justify-center items-center justify-self-end mr-4 flex ${
            color ? `text-${color}-400` : "text-green-400"
          }`}
        >
          {isOpen ? (
            <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
              <path
                fillRule="evenodd"
                d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                clipRule="evenodd"
              />
            </svg>
          ) : (
            <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
              <path
                fillRule="evenodd"
                d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                clipRule="evenodd"
              />
            </svg>
          )}
        </div>
      </div>
      <div
        className={`pl-4 pr-4 -mx-4 border-l-2  overflow-hidden pb-6 ${
          color ? `border-${color}-100` : "border-gray-100"
        }`}
        style={{
          maxHeight: isOpen ? "10000px" : "0",
          height: isOpen ? "auto" : "0",
          transition: "max-height 1s",
          boxSizing: "border-box",
          paddingBottom: isOpen ? "1.5rem" : "0",
        }}
      >
        {properties.children}
      </div>
    </div>
  );
};

export default Accordion;
