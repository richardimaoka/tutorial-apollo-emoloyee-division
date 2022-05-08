import { gql } from "@apollo/client";
import { DivisionCardFragment } from "../../generated/graphql";

export interface DivisionCardProps {
  fragment: DivisionCardFragment;
}

export const DivisionCard = ({ fragment }: DivisionCardProps): JSX.Element => {
  return (
    <div
      style={{
        backgroundColor: "#ffffff",
        height: "180px",
        filter: "drop-shadow(6px 6px 6px #00000029)",
      }}
    >
      {fragment.divisionDisplayName}
    </div>
  );
};

DivisionCard.fragment = gql`
  fragment DivisionCard on Division {
    divisionName
    divisionDisplayName
  }
`;
