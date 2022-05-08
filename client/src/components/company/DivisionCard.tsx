import { gql } from "@apollo/client";
import { DivisionCardFragment } from "../../generated/graphql";

export interface DivisionCardProps {
  fragment: DivisionCardFragment;
}

export const DivisionCard = ({ fragment }: DivisionCardProps): JSX.Element => {
  return (
    <div
      style={{
        filter: "drop-shadow(6px 6px 6px #00000029)",
      }}
    >
      <div
        style={{
          height: "50px",
          borderRadius: "8px 8px 0px 0px",
          backgroundColor: "#1470C3",
          padding: "2px 8px",
        }}
      >
        <span
          style={{
            color: "#f3f3f3",
            fontFamily: "'Noto Sans JP', sans-serif",
            fontSize: "28px",
            fontWeight: "700",
            lineHeight:
              "50px" /* same as height of enclosing <div>: vertical centering */,
          }}
        >
          {fragment.divisionDisplayName}
        </span>
      </div>
      <div
        //background
        style={{
          height: "130px",
          borderRadius: "0px 0px 8px 8px",
          backgroundColor: "#ffffff",
        }}
      ></div>
    </div>
  );
};

DivisionCard.fragment = gql`
  fragment DivisionCard on Division {
    divisionName
    divisionDisplayName
  }
`;
