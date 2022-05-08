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
          padding: "4px 16px",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
        }}
      >
        <div>
          <span
            style={{
              color: "#474646",
              fontFamily: "'Noto Sans JP', sans-serif",
              fontSize: "14px",
            }}
          >
            {fragment.numDepartments}部署
          </span>
          <span
            style={{
              color: "#474646",
              fontFamily: "'Noto Sans JP', sans-serif",
              fontSize: "14px",
              marginLeft: "4px",
            }}
          >
            {fragment.numMembers}人
          </span>
        </div>
        <div>
          <span
            style={{
              display: "inline-block",
              width: "100%",
              textAlign: "right",
              fontFamily: "'Noto Sans JP', sans-serif",
              fontSize: "28px",
              fontWeight: "900",
              color: "#1470C3",
            }}
          >
            {fragment.divisionDisplayNameEn}
          </span>
        </div>
      </div>
    </div>
  );
};

DivisionCard.fragment = gql`
  fragment DivisionCard on Division {
    divisionName
    divisionDisplayName
    divisionDisplayNameEn
    numDepartments
    numMembers
  }
`;
