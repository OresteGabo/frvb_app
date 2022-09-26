enum AccountType {
  ///Normal account can only watch , save and all other sort of things that doenst include modifying, except his data
  ///AN ACCOUNT IS BY DEFAULT NORMAL
  NORMAL,

  ///Referee account can modify live scores, and match result
  REFEREE,

  ///Can add articles, modify articles (only articles he created)
  journalist,

  ///Can organise competitions, invite teams, and ...
  administrator,

  ///His actions will be determined later
  developper,

  ///Teams has the priviledge of removing itself in a competition, ask the permission to join, add athletes,...
  ///The account is set to be managed by the team manager(president) or a coach in cas the team manager want to share priviledges
  team,

  ///Athletes can join a team (with the permission of a team coach or ,
  athlete
}

enum Priviledge {
  ///This priviledge will allow an account that holds it, to add an article
  addArticles,

  ///This priviledge will allow the holder to modify a certain article, under different situation
  modifyArticles,

  ///The owner of this priviledge, can delete articles, according to some situations
  deleteArticles,

  ///The holder of this priviledge, will be able to add athlete in a certain team
  addAthleteInTeam,

  ///The owner of this priviledge will be able to replace the coach, or just remove him/her
  changeTeamCoach,

  ///The owner of this priviledge can join a team, like an athlete,coach,...
  //canJoinTeam,

  ///The owner of this priviledge can leave a team, like an athlete,coach,...
  canLeaveTeam,
}
