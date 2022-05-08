import { gql } from "@apollo/client";
import { DivisionCardFragment } from "../../generated/graphql";

export interface DivisionCardProps {
  fragment: DivisionCardFragment;
}

export const DivisionCard = ({ fragment }: DivisionCardProps): JSX.Element => {
  return <div>{fragment.divisionName}</div>;
};

DivisionCard.fragment = gql`
  fragment DivisionCard on Division {
    divisionName
  }
`;
